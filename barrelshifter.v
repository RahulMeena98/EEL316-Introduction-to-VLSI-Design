`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// RAHUL MEENA
// 2016UEE0088
// ASSSIGNMENT #2
// Create Date:    19:17:26 02/27/2019 
// Design Name:    MODIFIED Left Right Barrel Shifter
// Module Name:    barrelshifter 
// 
//////////////////////////////////////////////////////////////////////////////////
module multx(X0,X1,S,E,O);
input  X0,X1,E;
input S;
output O;
reg O;
always @(X0,X1,S,O,E)
begin
	if(S == 1'b0 && E == 1'b0)
		O=X0;
	else if(S==1'b1 && E == 1'b0)
		O=X1;
	else O=1'b0;		
end
endmodule

module barrelshifter (A,B,R,OUT);
 input [7:0] A;
 input [2:0]B;
 input  R;
 output [7:0]OUT;
 wire [7:0] R41,R42,R4,R21,R22,R2,R11,R12,R1;
 //4bit shift right 
		multx  m0 (A[0],A[4],B[2],~R,R41[0]);
		multx  m1 (A[1],A[5],B[2],~R,R41[1]);
		multx  m2 (A[2],A[6],B[2],~R,R41[2]);
		multx  m3 (A[3],A[7],B[2],~R,R41[3]);
		multx  m4 (A[4],1'b0,B[2],~R,R41[4]);
		multx  m5 (A[5],1'b0,B[2],~R,R41[5]);
		multx  m6 (A[6],1'b0,B[2],~R,R41[6]);
		multx  m7 (A[7],1'b0,B[2],~R,R41[7]);
//4bit left shift
		multx  m8 (A[0],1'b0,B[2],R,R42[0]);
		multx  m9 (A[1],1'b0,B[2],R,R42[1]);
		multx  m10 (A[2],1'b0,B[2],R,R42[2]);
		multx  m11 (A[3],1'b0,B[2],R,R42[3]);
		multx  m12 (A[4],A[0],B[2],R,R42[4]);
		multx  m13 (A[5],A[1],B[2],R,R42[5]);
		multx  m14 (A[6],A[2],B[2],R,R42[6]);
		multx  m15 (A[7],A[3],B[2],R,R42[7]);
		assign R4 = R41 + R42;
//2bit right shift
		multx  m20 (R4[0],R4[2],B[1],~R,R21[0]);
		multx  m21 (R4[1],R4[3],B[1],~R,R21[1]);
		multx  m22 (R4[2],R4[4],B[1],~R,R21[2]);
		multx  m23 (R4[3],R4[5],B[1],~R,R21[3]);
		multx  m24 (R4[4],R4[6],B[1],~R,R21[4]);
		multx  m25 (R4[5],R4[7],B[1],~R,R21[5]);
		multx  m26 (R4[6],1'b0,B[1],~R,R21[6]);
		multx  m27 (R4[7],1'b0,B[1],~R,R21[7]);
//2bit left shift
		multx  m28 (R4[0],1'b0,B[1],R,R22[0]);
		multx  m29 (R4[1],1'b0,B[1],R,R22[1]);
		multx  m210 (R4[2],R4[0],B[1],R,R22[2]);
		multx  m211 (R4[3],R4[1],B[1],R,R22[3]);
		multx  m212 (R4[4],R4[2],B[1],R,R22[4]);
		multx  m213 (R4[5],R4[3],B[1],R,R22[5]);
		multx  m214 (R4[6],R4[4],B[1],R,R22[6]);
		multx  m215 (R4[7],R4[5],B[1],R,R22[7]);
		assign R2 = R21 + R22;
//1bit right shift
		multx  m120 (R2[0],R2[1],B[0],~R,R11[0]);
		multx  m121 (R2[1],R2[2],B[0],~R,R11[1]);
		multx  m122 (R2[2],R2[3],B[0],~R,R11[2]);
		multx  m123 (R2[3],R2[4],B[0],~R,R11[3]);
		multx  m124 (R2[4],R2[5],B[0],~R,R11[4]);
		multx  m125 (R2[5],R2[6],B[0],~R,R11[5]);
		multx  m126 (R2[6],R2[7],B[0],~R,R11[6]);
		multx  m127 (R2[7],1'b0,B[0],~R,R11[7]);
//1bit left shift
		multx  m128 (R2[0],1'b0,B[0],R,R12[0]);
		multx  m129 (R2[1],R2[0],B[0],R,R12[1]);
		multx  m1210 (R2[2],R2[1],B[0],R,R12[2]);
		multx  m1211 (R2[3],R2[2],B[0],R,R12[3]);
		multx  m1212 (R2[4],R2[3],B[0],R,R12[4]);
		multx  m1213 (R2[5],R2[4],B[0],R,R12[5]);
		multx  m1214 (R2[6],R2[5],B[0],R,R12[6]);
		multx  m1215 (R2[7],R2[6],B[0],R,R12[7]);
		assign R1 = R11 + R12;
		assign OUT = R1;
endmodule 