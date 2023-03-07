//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract ERC721{

    string public name;
    uint public totalSupply=0;
    string public symbol;
    address isOwner;
    uint actualPrice = 5000;
    uint _whitelistPrice = 2000;
       
    constructor(){
        name = "MyToken";
        symbol = "SGT";
        isOwner = msg.sender;
    }

    mapping(address => uint) _balanceOf;
    mapping(uint => address) _ownerOf;
    mapping(uint => address) public _approvalOf;
    mapping(address => mapping(address => bool)) public _approveAll;
    mapping(address => bool) _whiteListed;

    function _mint( uint tokenId) public payable{
        
        if(_whiteListed[msg.sender]){
            require(msg.value == _whitelistPrice ,"invalid Price");
            _balanceOf[msg.sender]++;
            _ownerOf[tokenId] = msg.sender;
            totalSupply ++;
                
        }
        else{
            require(msg.value == actualPrice,"invalid user or price");
            _balanceOf[msg.sender]++;
            _ownerOf[tokenId] = msg.sender;
            totalSupply ++;
        }
    
    } //Done

    function whiteList(address _WL) public{
        require(msg.sender == isOwner,"you Must be the Owner");
        _whiteListed[_WL] = true;
    }

    function isWhiteList(address _IWL) public view returns(bool){
        return _whiteListed[_IWL];  
    }

    function balanceOf(address owner) public view returns(uint) {
        return _balanceOf[owner];
    } // Done

    function ownerOf(uint tokenId) public view returns(address) {
        return _ownerOf[tokenId];
    } // done

    function approve(address to, uint tokenId) public {
        address owner = _ownerOf[tokenId];

        require(msg.sender == owner,"Must be the Owner");
        _approvalOf[tokenId] = to;

    } // done

    function getApproved(uint tokenId) public view returns(address){
        require(msg.sender != address(0),"Should not equals to Zero");
        return _approvalOf[tokenId];
    } // done

    function transferFrom(address from, address to, uint tokenId) public {
        require(from != address(0) || to != address(0),"Address must not be Zero");
        require(_ownerOf[tokenId] == msg.sender || _approvalOf[tokenId] == msg.sender, "Must be the rights to transfer Token");

        _balanceOf[to]++;
        _balanceOf[from]--;
        _ownerOf[tokenId] = to;

    } // done

    function setApprovalForAll(address operator,bool approved) public {
        _approveAll[msg.sender][operator] = approved;
    } // done

    function isApprovedForAll(address owner, address operator) public view returns (bool) {
        require(_approveAll[owner][operator]);
        return(true);
    } // done

}
