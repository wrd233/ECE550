module overflow_check(
    AV,         // A尝试反转后的结果
    BV,         // B尝试反转后的结果
    addOut,     // AV + BV 的结果
    overflow    // overflow的结果
);
    input AV, BV, addOut;
    output overflow;

    wire check1, check2;
    wire AV_negative, BV_negative, addOut_negative;

    not_gate ng1(AV, AV_negative);
    not_gate ng2(BV, BV_negative);
    not_gate ng3(addOut, addOut_negative);

    and(check1, AV_negative, BV_negative, addOut);
    and(check2, AV, BV, addOut_negative);

    or(overflow, check1, check2);

endmodule
