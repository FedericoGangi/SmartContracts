// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameAssets is ERC1155, Ownable {

    string public name = "My Game Assets";
    
    uint256 public constant ORO = 1;
    uint256 public constant ARGENTO = 2;
    uint256 public constant SPADA = 3;
    uint256 public constant SCUDO = 4;
    
    constructor(address initialOwner) ERC1155("https://lime-leading-quelea-921.mypinata.cloud/ipfs/QmZgXrHEvt97LojpCx1yRMnxArJBmQ9pZBFCfhbFMt5PeG/{id}.json") Ownable(initialOwner) {
        mint(msg.sender, ORO, 100, "");
        mint(msg.sender, ARGENTO, 100, "");
        mint(msg.sender, SPADA, 1, "");
        mint(msg.sender, SCUDO, 1, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
