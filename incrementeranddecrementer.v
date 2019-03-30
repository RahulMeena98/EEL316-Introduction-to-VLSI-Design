`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// RAHUL MEENA
// 2016UEE0088
// ASSIGNMENT #1
// Create Date:    16:25:57 02/27/2019 
// Design Name:    Incrementer/Decrementer
// Module Name:    incrementeranddecrementer 
//
//////////////////////////////////////////////////////////////////////////////////
module fulladder (a,b,c, sum, carry);
input a,b,c;
output sum, carry;
wire s1,s2,s3;
xor xor1 (s1, a,b);
xor xor2 (sum , s1 ,c);
and and1  (s2,a ,b);
and and2 (s3, c, s1);
or or1 (carry,s2,s3);
endmodule

module incrementeranddecrementer(X,P,O);
 input [5:0] X;
 input P;
 output [6:0] O;
 wire [5:0] C;
 wire[5:0] xors;
 xor xor0( xors[0], 1'b1, P);
 xor xor1( xors[1], 1'b0, P);
 xor xor2( xors[2], 1'b0, P);
 xor xor3( xors[3], 1'b0, P);
 xor xor4( xors[4], 1'b0, P);
 xor xor5( xors[5], 1'b0, P);
 fulladder fa0( X[0] ,xors[0], P, O[0],C[0]);
 fulladder fa1( X[1] ,xors[1], C[0], O[1],C[1]);
 fulladder fa2( X[2] ,xors[1], C[1], O[2],C[2]);
 fulladder fa3( X[3] ,xors[1], C[2], O[3],C[3]);
 fulladder fa4( X[4] ,xors[1], C[3], O[4],C[4]);
 fulladder fa5( X[5] ,xors[1], C[4], O[5],C[5]);
 assign O[6] = C[5];
endmodule
