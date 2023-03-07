//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;


//  Importing IERC721 form openZeppelin
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract ERC721 {

    mapping (address => uint) _balanceOf;
    mapping (uint => address) _ownerOf;

    function balanceOf(address owner) public view returns (uint256 balance){
        return _balanceOf[owner];
    }

    function ownerOf(uint tokenId) public view returns (address owner){
        return _ownerOf[tokenId];
    }

// safeTransferFrom(from, to, tokenId, data)

// safeTransferFrom(from, to, tokenId)

// transferFrom(from, to, tokenId)

// approve(to, tokenId)

// setApprovalForAll(operator, _approved)

// getApproved(tokenId)

// isApprovedForAll(owner, operator)
}