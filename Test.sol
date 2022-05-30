pragma solidity ^0.5.13;

contract MyFirstContract {
    // uint256 public myInt ;

    // function setUnit(uint _myInt) public {
    //     myInt = _myInt;
    // }

    // bool public myBool;

    // function setBool(bool _myBool) public {
    //     myBool = _myBool;
    // }

    // uint public myInt8;

    // function incrementUint() public {
    //     myInt8++;
    // }
    // function decrementUint() public {
    //     myInt8--;
    // }

    // address public myAddress;

    // function setAddress(address _myAddress) public{
    //     myAddress = _myAddress;
    // }
    // function getBalance() public view returns(uint){
    //     return myAddress.balance;
    // }
    address owner;
    bool public paused;
    constructor() public{
        owner = msg.sender;
    }
    mapping(address => uint) public balanceReceived;

    function withdrawAllFunds(address payable _to) public{
        require(msg.sender == owner," You are not the owner");
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }

    
    function sendMoney() public payable{
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    // function setPaused(bool _paused) public{
    //     require(msg.sender == owner,"You are not the owner , so you can't Pause");
    //     paused = _paused;
    // }

    // function withdrawAllMoneyTo( address payable _to ) public{
    //     require(msg.sender ==  owner, "You are not the owner");
    //     // require(!paused, "Contract is Paused");
    //     uint balanceToSend = balanceReceived[msg.sender];
    //     balanceReceived[msg.sender] = 0;
    //     _to.transfer(balanceToSend);
    // }
    
    // function destroyContract(address payable _to) public {
    //     require(msg.sender ==  owner, "You are not the owner");
    //     selfdestruct(_to);
    // }

    // function windrawFullMoney(address payable _to) public{
    //     uint balanceToTransfer = balanceReceived[msg.sender];
    //     balanceReceived[msg.sender] = 0;
    //     _to.transfer(balanceToTransfer);
    // }

    // function withdrawFunds(address payable _to, uint _amount) public{
    //     require(balanceReceived[msg.sender] >= _amount, "You dont have enough funds");
    //     balanceReceived[msg.sender] -= _amount;
    //     _to.transfer(_amount);
    // }
    

}