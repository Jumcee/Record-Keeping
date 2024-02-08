// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract RecordKeeping {
    address public principal;
    mapping(address => bool) public students;
    mapping(address => bool) public teachers;
    mapping(address => string) public studentRecords;
    mapping(address => uint256) public studentScores;

    // Assign principal role
    constructor() {
        principal = msg.sender;
    }

    // Principal alone has the access to add students to the organization
    function addStudent(address studentAddress) public onlyPrincipal {
        students[studentAddress] = true;
    }

    // Principal alone has the access to add teachers to the organization
    function addTeacher(address teacherAddress) public onlyPrincipal {
        teachers[teacherAddress] = true;
    }

    modifier onlyPrincipal() {
        require(msg.sender == principal, "Access denied");
        _;
    }

    function updateStudentRecord(address studentAddress, string memory newData) public {
        require(students[msg.sender], "Access denied");
        require(studentAddress == msg.sender, "You can only update your own record");
        studentRecords[studentAddress] = newData;
        emit StudentRecordUpdated(studentAddress, newData);
    }

    function updateStudentScore(address studentAddress, uint256 newScore) public {
        require(teachers[msg.sender], "Access denied");
        studentScores[studentAddress] = newScore;
        emit StudentScoreUpdated(studentAddress, newScore);
    }

    event StudentRecordUpdated(address indexed student, string newData);
    event StudentScoreUpdated(address indexed student, uint256 newScore);
}
