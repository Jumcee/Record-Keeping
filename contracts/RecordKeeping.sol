// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract RecordKeeping {
    address public principal;
    mapping(address => bool) public students;
    mapping(address => bool) public teachers;

// assign principal role
    constructor() {
        principal = msg.sender;
    }

// principal alone has the access to add students to the organization
    function addStudent(address studentAddress) public onlyPrincipal {
        students[studentAddress] = true; 
    }

// principal alone has the access to add teachers to the organization 
    function addTeacher(address teacherAddress) public onlyPrincipal {
        teachers[teacherAddress] = true;
    }


}