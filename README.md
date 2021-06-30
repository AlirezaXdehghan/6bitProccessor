# 6bitProccessor

A six bit processor designed for the project of Hardware-Software Co-Design course using VHDL language

The proccessor can execute LOAD, ADD, SUB and JNZ instructions
```javascript
    LOAD Rx,Value  //the given value will be loaded in the desired register
    ADD Rx,Ry  //the result of the addition of the two registers will be saved in the first register
    SUB Rx,Ry  //the result of the subtraction of the two registers will be saved in the first register
    JNZ Rx,Address  //the Program Counter jumps to the given address if the given register contains anything but 0
```
### OpCodes
OpCode  | Command
------------- | -------------
00  | LOAD
01  | ADD 
10  | SUB
11  | JNZ 
