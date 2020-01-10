pragma solidity ^0.5.0;

contract EnrollingStudent{
    
    enum Gender { Male, Female } 
    enum ClassType { Online, Onsite }
    uint public studentCount = 0;
    
    // gender student type
    struct Student{
        string name;
        Gender gender;
        ClassType classType;
    }

    mapping (uint => Student) public students;
    
    // adding student into the class
    function addStudent(string memory _name,uint8 _gender,uint8 _classType) public  {
        studentCount += 1;
        students[studentCount] = Student(_name, Gender(_gender),ClassType(_classType));
    }
    
    
    // shows the balance of addmission a/c
    function collectedAmount() public view returns(uint) {
        return admissionFeesAddress.balance; 
    }
    
    
    address payable public admissionFeesAddress = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148; // this is the address where you want your eth to be deposited 

    // pays atleast 2Eth to this a/c
    function pay() public payable {
        if (msg.value >= 2000000000000000000) {
            admissionFeesAddress.transfer(msg.value);
        }    
        
    }
    
}