pragma solidity >=0.6.0 <0.8.0;
import "@openzeppelin/contracts/cryptography/ECDSA.sol";


contract Authentication  {

    struct data{
    address signer;
    string hashAlgorithm;
    uint timestamp;
    string uri;
    string contentype; //Metadata { // address creator;// uint timestamp;// string contentUri;// string contentType; }
    }

    mapping(bytes=> data) creator;

    event Check(address indexed _address,address indexed _address_from_ecerecoveropcode);

    function store_sig(bytes memory _signature,address signer,string memory hashAlgorithm, uint timestamp, string memory uri ,string memory contentype) public{
        creator[_signature] = data( msg.sender,hashAlgorithm, block.timestamp,uri,contentype);
       }

    function view_metadata(bytes memory _signature) public returns(address, string memory, uint, string memory, string memory){
                
                data memory s = creator[_signature];

                return (
                    s.signer,
                    s.hashAlgorithm, 
                    s.timestamp,
                    s.uri,
                    s.contentype
                );
    }


    function verify_cont(bytes32  hash, bytes memory _signature, address _creator) public returns(bool){
        bytes32 _msghash=keccak256( abi.encodePacked("\x19Ethereum Signed Message:\n32", hash) );
        address val= ECDSA.recover(_msghash, _signature);
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);
        address val2= ecrecover(_msghash, v, r, s);
        emit Check(val,val2);
        if(val==_creator) return true;
        else {return false;}
    }

        function splitSignature(bytes memory sig ) public pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(sig.length == 65, "invalid signature length");

        assembly {
            /*
            add(sig, 32) = pointer of sig + 32
            skips first 32 bytes of signature
            */
            // first 32 bytes, after the length prefix
            r := mload(add(sig, 32))
            // second 32 bytes
            s := mload(add(sig, 64))
            // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(sig, 96)))
        }

      
    }

}