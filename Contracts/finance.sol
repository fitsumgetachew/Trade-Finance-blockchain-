// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LetterOfCredit {
    // Struct to represent a letter of credit
    struct Lc {
        uint256 id;
        uint256 expiryDate;
        address buyer;
        address bank;
        address seller;
        uint256 amount;
        string status;
    }

    // Mapping to store letter of credit details
    mapping(uint256 => Lc) public lettersOfCredit;

    // Function to request a letter of credit
    function requestLetterOfCredit(
        uint256 _id,
        uint256 _expiryDate,
        address _buyer,
        address _bank,
        address _seller,
        uint256 _amount,
        string memory _status
    ) public {
        // Check if the same LC with the same id exists already
        require(lettersOfCredit[_id].id == 0, "Letter of credit with this ID already exists");

        // Create a new letter of credit
        Lc memory newLc = Lc({
            id: _id,
            expiryDate: _expiryDate,
            buyer: _buyer,
            bank: _bank,
            seller: _seller,
            amount: _amount,
            status: _status
        });

        // Store the new letter of credit in the mapping
        lettersOfCredit[_id] = newLc;
    }

    // Function to issue the letter of credit
    function issueLetterOfCredit(uint256 _id) public {
        // Check if LC is present in the ledger
        require(lettersOfCredit[_id].id != 0, "Letter of credit with this ID does not exist");

        // Update the status of the letter of credit to "Issued"
        lettersOfCredit[_id].status = "Issued";
    }

    // Function to accept the letter of credit
    function acceptLetterOfCredit(uint256 _id) public {
        // Check if LC is present in the ledger
        require(lettersOfCredit[_id].id != 0, "Letter of credit with this ID does not exist");

        // Update the status of the letter of credit to "Accepted"
        lettersOfCredit[_id].status = "Accepted";
    }

    // Function to view the letter of credit details
    function viewLetterOfCredit(uint256 _id) public view returns (Lc memory) {
        // Check if LC is present in the ledger
        require(lettersOfCredit[_id].id != 0, "Letter of credit with this ID does not exist");

        // Return the details of the letter of credit
        return lettersOfCredit[_id];
    }
}
