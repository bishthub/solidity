pragma solidity ^0.8;

contract WorkingWithVariables {
    // uint256 public myUint;

    // function setMyUint(uint _myUint) public{
    //     myUint = _myUint;
    // }

    // bool public myBool;

    // function setBool(bool _myBool) public{
    //     myBool = _myBool;
    // }

    // uint8 public myUint8;

    // function incrementUint() public{
    //     myUint8++;
    // } 
    // function decrementUint() public{
    //     myUint8--;
    // }

    // address public myAddress;

    // function setAddress(address _myAddress) public {
    //     myAddress = _myAddress;
    // }
    // function getBalance() public view returns(uint){
    //     return myAddress.balance;
    // }

    // string public myString;
    // function setString (string memory _myString) public{
    //     myString = _myString;
    // }

    // uint public balanceReceived;
    // function receiveMoney() public payable{
    //     balanceReceived += msg.value;
    // }
    // struct Payment{
    //     uint amount;
    //     uint timestamps;
    // }
    // struct Balance{
    //     uint totalBalance;
    //     uint numPayments;
    //     mapping(uint => Payment) payments;
    // }
    // mapping(address => Balance) public balanceReceived;
    mapping(address => uint) public balanceReceived;

    address owner;
    constructor() public{
        owner = msg.sender;
    }
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        require(_amount <= balanceReceived[msg.sender],"not enough funds");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    receive() external payable {
        receiveMoney();
    }
    // function sendMoney() public payable{
    //     balanceReceived[msg.sender].totalBalance += msg.value;
    //     Payment memory payment = Payment(msg.value, block.timestamp);
    //     balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
    //     balanceReceived[msg.sender].numPayments++;
    // }
    // function getBalance() public view returns(uint){
    //     return address(this).balance;
    // }

    // function withdrawMoney(address payable _to) public{
    //     // require(msg.sender == owner, "You are not the owner");
    //     uint balanceToSend = balanceReceived[msg.sender].totalBalance;
    //     balanceReceived[msg.sender].totalBalance = 0;
    //     _to.transfer(balanceToSend);

    // }
    // function withdrawSpecificMoney(address payable _to , uint _amount) public{
    //   require(balanceReceived[msg.sender].totalBalance >= _amount, "not enough funds");
    //   balanceReceived[msg.sender].totalBalance -= _amount;
    //   _to.transfer(_amount); 
    // }
    // mapping(uint => bool) public myMapping;
    // mapping(address => bool) public addressMapping;

    // function setValue(uint _index) public{
    //     myMapping[_index] = true;
    // }
    // address owner;
    
    // constructor() public{
    //     owner = msg.sender;
    // }
    // function setAdress() public{
    //     require(msg.sender ==  owner, "You are not the owner");
    //     addressMapping[msg.sender] = true;
    // }



}