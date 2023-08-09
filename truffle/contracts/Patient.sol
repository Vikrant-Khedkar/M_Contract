pragma solidity ^0.5.16;

contract PatientRecords {
    struct Patient {
        string name;
        uint256 dateOfBirth;
        uint256 aadharNo;
        string gender;
        string insuranceId;
        Record[] records;
        // mapping(uint256 => TestReport[]) recordTestReports;
    }

    struct Record {
        uint256 age;
        uint256 dateOfVisit;
        string diagnosis;
        string prescription;
        // string[] testsAdvised;
        uint256 fees;
        uint256 followUp;
        uint256 bloodPressure;
        uint256 weight;
    }

    // struct TestReport {
    //     string testName;
    //     string ipfsCID;
    // }

    mapping(address => Patient) public patients;

    function addPatient(
        string memory _name,
        uint256 _dateOfBirth,
        uint256 _aadharNo,
        string memory _gender,
        string memory _insuranceId
    ) public {
        Patient storage patient = patients[msg.sender];
        patient.name = _name;
        patient.dateOfBirth = _dateOfBirth;
        patient.aadharNo = _aadharNo;
        patient.gender = _gender;
        patient.insuranceId = _insuranceId;
    }

    function addRecord(
        uint256 _age,
        uint256 _dateOfVisit,
        string memory _diagnosis,
        string memory _prescription,
        // string[] memory _testsAdvised,
        // string[] memory _testNames,
        // string[] memory _ipfsCIDs,
        uint256 _fees,
        uint256 _followUp,
        uint256 _bloodPressure,
        uint256 _weight
    ) public {
        Patient storage patient = patients[msg.sender];
        Record memory record;
        record.age = _age;
        record.dateOfVisit = _dateOfVisit;
        record.diagnosis = _diagnosis;
        record.prescription = _prescription;
        // record.testsAdvised = _testsAdvised;
        record.fees = _fees;
        record.followUp = _followUp;
        record.bloodPressure = _bloodPressure;
        record.weight = _weight;

        patient.records.push(record);

        // TestReport[] storage testReports = patient.recordTestReports[patient.records.length - 1];
        
        // require(
        //     _testNames.length == _ipfsCIDs.length,
        //     "Length mismatch between test names and IPFS CIDs"
        // );
        
        // for (uint256 i = 0; i < _testNames.length; i++) {
        //     // TestReport memory testReport;
        //     testReport.testName = _testNames[i];
        //     testReport.ipfsCID = _ipfsCIDs[i];
        //     testReports.push(testReport);
        // }
    }
}
