`timescale 1ns/1ps

module tb_ram;

    // Inputs to the RAM module
    reg clk;
    reg write_enable;
    reg [9:0] address;
    reg [7:0] data_in;

    // Output from the RAM module
    wire [7:0] data_out;

    // Instantiate the RAM module
    ram ram_instance (
        .clk(clk),
        .write_enable(write_enable),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize signals
        write_enable = 0;
        address = 10'b0;
        data_in = 8'h0;
        #10;

        // Write data 'AA' to address 0
        write_enable = 1;
        address = 10'd0;
        data_in = 8'hAA;
        #10;

        // Write data 'BB' to address 50
        address = 10'd50;
        data_in = 8'hBB;
        #10;

        // Write data 'CC' to address 1023
        address = 10'd1023;
        data_in = 8'hCC;
        #10;

        // Release write enable
        write_enable = 0;
        #10;

        // Read from address 0, expect 'AA'
        address = 10'd0;
        #10;

        // Read from address 50, expect 'BB'
        address = 10'd50;
        #10;

        // Read from address 1023, expect 'CC'
        address = 10'd1023;
        #10;

        $finish;
    end

endmodule
