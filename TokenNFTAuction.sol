pragma solidity ^0.4.18;

import "./TwentyFourByteTokenBidAuction.sol";
import "./NFTAuction.sol";

contract TokenNFTAuction is TwentyFourByteTokenBidAuction, NFTAuction {
    /// Prepare an auction for asset with ID `_assetId` on the ERC821 registry at `_assetRegistry` in exchange for the ERC20 token at `_bidToken` in minimum increments of `_fixedIncrement` or current bid / `_fractionalIncrement`, whichever is greater, ending at epoch `_endTime` or `_extendBlocks` blocks after the last bid (both inclusive, whichever comes last, choose a sufficient number of blocks to decrease the chance of miner frontrunning) . Call start() after transferring the asset to the auction's address.
    function TokenNFTAuction(
        address _assetRegistry,
        uint256 _assetId,
        address _bidToken,
        uint40 _endTime,
        uint32 _extendBlocks,
        uint80 _fixedIncrement,
        uint24 _fractionalIncrement
    ) public NFTAuction(_assetRegistry, _assetId, _endTime, _extendBlocks, _fixedIncrement, _fractionalIncrement) TokenBidAuction(_bidToken, _endTime, _extendBlocks, _fixedIncrement, _fractionalIncrement)
    {
    }
}