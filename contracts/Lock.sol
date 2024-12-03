// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "only owner can access");
        _;
    }

    struct Employee {
        uint256 Emp_id;
        string Emp_name;
        string Emp_address;
        uint256 Emp_PhNo;
        uint256 Emp_salary;
        string Emp_department;
    }

    Employee[] employees;

    function createEmp(uint256 id, string memory name, string memory emp_address, uint256 phno, uint256 salary, string memory dep) public onlyOwner {
        employees.push(Employee({
           Emp_id : id,
           Emp_name : name,
           Emp_address : emp_address,
           Emp_PhNo : phno,
           Emp_salary : salary,
           Emp_department : dep
        }));
    }

    function getAllEmployee() public view returns (Employee[] memory) {
        return employees;
    }

    function getAllEmplength() public view returns (uint256) {
        return employees.length;
    }
}
