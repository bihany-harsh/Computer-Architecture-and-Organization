module eq1 
    (
        input i0, i1,
        output eq
    );

    assign p0 = ~i0 & ~i1;
    assign p1 = i0 & i1;

    assign eq = p0 | p1;

endmodule

module eq2
    (
        input wire[1:0] a, b,
        output wire aeqb
    );

wire e0, e1;

// instantiating two 1-bit comparators
eq1 eq_bit0_unit (.i0(a[0]), .i1(b[0]), .eq(e0));
eq1 eq_bit1_unit (.i0(a[1]), .i1(b[1]), .eq(e1));

assign aeqb = e0 & e1;

endmodule