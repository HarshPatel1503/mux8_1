module mux8_1(in1,in2,in3,in4,in5,in6,in7,in8,s,out);
input in1,in2,in3,in4,in5,in6,in7,in8;
input [2:0] s;
output out;
wire [5:0] d;

mux2_1 m1(d[0],in1,in2,s[0]);
mux2_1 m2(d[1],in3,in4,s[0]);
mux2_1 m3(d[2],in5,in6,s[0]);
mux2_1 m4(d[3],in7,in8,s[0]);
mux2_1 m5(d[4],d[0],d[1],s[1]);
mux2_1 m6(d[5],d[2],d[3],s[1]);
mux2_1 m7(out,d[4],d[5],s[2]);
endmodule

module mux8_1_tb();
reg [7:0] in1;
reg [7:0] in2;
reg [7:0] in3;
reg [7:0] in4;
reg [7:0] in5;
reg [7:0] in6;
reg [7:0] in7;
reg [7:0] in8;
reg [2:0]s;
wire [7:0] out;

mux8_1 uut(.out(out),.s(s),.in1(in1),.in2(in2),.in3(in3),.in4(in4),.in5(in5),.in6(in6),.in7(in7),.in8(in8));

initial begin
in1=8'b10110110;in2=8'b10110110;in3=8'b10110110;in4=8'b10110110;in5=8'b10110110;in6=8'b10110110;in7=8'b10110110;in8=8'b10110110;
#2 s=3'b000;
#2 s=3'b001;
#2 s=3'b010;
#2 s=3'b011;
#2 s=3'b100;
#2 s=3'b101;
#2 s=3'b110;
#2 s=3'b111;
end
initial begin $monitor("time=%0d,in1=%b,in2=%b,in3=%b,in4=%b,in5=%b,in6=%b,in7=%b,in8=%b,s=%b,out=%b", $time,in1,in2,in3,in4,in5,in6,in7,in8,s,out);
end
endmodule









