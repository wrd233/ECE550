/**
 * NOTE: This file will be swapped out for a grading
 * "skeleton" for testing. We will  remove your imem and dmem file.
 *
 * NOTE: skeleton should be your top-level module!
 *
 * This skeleton file serves as a wrapper around the processor to provide certain control signals
 * and interfaces to memory elements. This structure allows for easier testing, as it is easier to
 * inspect which signals the processor tries to assert when.
 */

module skeleton(clock, reset, stu_imem_clock, stu_dmem_clock, stu_processor_clock, stu_regfile_clock);
    input clock, reset;
    output stu_imem_clock, stu_dmem_clock, stu_processor_clock, stu_regfile_clock;
   
    /* 分时处理 */
    wire clk_divider_by2, clk_divider_by4;
    // // frequency_divider_by2 divider_by2(
    // //     .clk        (clock),
    // //     .rst        (reset),
    // //     .out_clk    (clk_divider_by2)
    // // );

    frequency_divider_by2 d1( clock , reset ,clk_divider_by2 );
    frequency_divider_by2 d2( clk_divider_by2 , reset ,clk_divider_by4 );

    // 为各个组件分配clock 
    // TODO: 待更新
    assign stu_processor_clock = clk_divider_by4;
    assign stu_regfile_clock = clk_divider_by4;
    // assign stu_processor_clock = clock;
    // assign stu_regfile_clock = clock;
    assign stu_imem_clock = ~clock;
    assign stu_dmem_clock = ~clock;

    /** IMEM **/
    // Figure out how to generate a Quartus syncram component and commit the generated verilog file.
    // Make sure you configure it correctly!
    wire [11:0] address_imem;
    wire [31:0] q_imem;
    imem my_imem(
        .address    (address_imem),            // address of data
        .clock      (stu_imem_clock),                  // you may need to invert the clock
        .q          (q_imem)                   // the raw instruction
    );

    /** DMEM **/
    // Figure out how to generate a Quartus syncram component and commit the generated verilog file.
    // Make sure you configure it correctly!
    wire [11:0] address_dmem;
    wire [31:0] data;
    wire wren;
    wire [31:0] q_dmem;
    dmem my_dmem(
        .address    (address_dmem),         // address of data
        .clock      (stu_dmem_clock),       // may need to invert the clock
        .data	    (data),                 // data you want to write
        .wren	    (wren),                 // write enable
        .q          (q_dmem)                // data from dmem
    );

    /** REGFILE **/
    // Instantiate your regfile
    wire ctrl_writeEnable;
    wire [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    wire [31:0] data_writeReg;
    wire [31:0] data_readRegA, data_readRegB;
    regfile my_regfile(
        stu_regfile_clock,
        ctrl_writeEnable,
        ctrl_reset,
        ctrl_writeReg,
        ctrl_readRegA,
        ctrl_readRegB,
        data_writeReg,
        data_readRegA,
        data_readRegB
    );

    /** PROCESSOR **/
    processor my_processor(
        // Control signals
        stu_processor_clock,                  // I: The master clock
        reset,                          // I: A reset signal

        // Imem
        address_imem,                   // O: The address of the data to get from imem
        q_imem,                         // I: The data from imem

        // Dmem
        address_dmem,                   // O: The address of the data to get or put from/to dmem
        data,                           // O: The data to write to dmem
        wren,                           // O: Write enable for dmem
        q_dmem,                         // I: The data from dmem

        // Regfile
        ctrl_writeEnable,               // O: Write enable for regfile
        ctrl_writeReg,                  // O: Register to write to in regfile
        ctrl_readRegA,                  // O: Register to read from port A of regfile
        ctrl_readRegB,                  // O: Register to read from port B of regfile
        data_writeReg,                  // O: Data to write to for regfile
        data_readRegA,                  // I: Data from port A of regfile
        data_readRegB                   // I: Data from port B of regfile
    );

endmodule