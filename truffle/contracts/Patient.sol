pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

contract PatientRecords {
    struct Patient {
        address account_address;
        string username;
        string name;
        string gender;
        uint256 dateOfBirth;
        uint256 created_at;
    }
    Patient[] public patients;

    function addPatient(
        address _account_address,
        string memory _username,
        string memory _name,
        string memory _gender,
        uint256 _dateOfBirth,
        uint256 _created_at
    ) public {
        patients.push(Patient({ account_address : _account_address,
        name : _name,
        username : _username,
        gender : _gender,
        dateOfBirth : _dateOfBirth,
        created_at : _created_at}));
        
    }

    struct Record {
        uint256 id;
        address user_address;
        string title;
        uint256 date;
        string filename;
        string file;
        uint256 created_at;
    } 
    Record[] public records;
    
    function addRecord(
        uint256 _id,
        string memory _title,
        uint256 _date,
        string memory _filename,
        string memory _file,
        uint256 _created_at
    ) public {
    
    records.push(Record({
            id: _id,
            user_address: msg.sender,
            title: _title,
            date: _date,
            filename: _filename,
            file: _file,
            created_at: _created_at
    }));
    }
function getCount() public view returns(uint count) {
    return records.length;
}
    function getAllRecordsForAddress(address user_address) public view returns (Record[] memory) {
        uint i;
        uint count = 0;
        for (i = 0; i < getCount(); i++) {
            if (records[i].user_address == user_address) {
                count++;
            }
        }

        Record[] memory userRecords = new Record[](count);
        count = 0;
        for (i = 0; i < getCount(); i++) {
            if (records[i].user_address == user_address) {
                userRecords[count] = records[i];
                count++;
            }
        }
        return userRecords;
    }
    
    
}
