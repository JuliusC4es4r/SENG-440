#include <systemc.h>

SC_MODULE(fast_multiplier) {
public:
    // Ports
    sc_in<bool> clk;      // Clock input
    sc_in<sc_lv<8>> a;
    sc_in<sc_lv<8>> b;
    sc_out<sc_lv<16>> output;

    // Constructor
    SC_CTOR(fast_multiplier) {
        SC_CTHREAD(multiply, clk.pos());
    }

private:
    // Internal signals
    sc_lv<8> a_temp, b_temp;
    sc_lv<16> out_temp;

    // Method for multiplication
    void multiply() {
        while (true) {
            // Wait for a positive edge of the clock
            wait();

            // Convert sc_lv to sc_signed for multiplication
            sc_int<8> a_int = a.read().to_int();
            sc_int<8> b_int = b.read().to_int();

            // Perform multiplication
            sc_int<16> out_int = a_int * b_int;

            // Convert sc_signed to sc_lv for output
            out_temp = sc_lv<16>(out_int.to_string(SC_BIN).c_str());

            // Assign output
            output.write(out_temp);
        }
    }
};

#include <systemc.h>
#include <cstdlib> // for rand() and srand()
#include <ctime>   // for time()

SC_MODULE(testbench) {
public:
    // Ports
    sc_in<bool> clk_tb;   // Clock input
    sc_out<sc_lv<8>> a;
    sc_out<sc_lv<8>> b;
    sc_in<sc_lv<16>> output;

    // Constructor
    SC_CTOR(testbench) {
        SC_CTHREAD(generate_input, clk_tb.pos());

        // Set up tracing
        tracefile = sc_create_vcd_trace_file("tracefile");
        sc_trace(tracefile, clk_tb, "clk");
        sc_trace(tracefile, a, "a");
        sc_trace(tracefile, b, "b");
        sc_trace(tracefile, output, "output");
    }

    // Destructor
    ~testbench() {
        sc_close_vcd_trace_file(tracefile);
    }

    // Public clk_period variable
    sc_time clk_period;

private:
    // Internal variables
    sc_trace_file* tracefile;

    // Generate input values for 100 test cases
    void generate_input() {
        srand(static_cast<unsigned>(time(0))); // Initialize random seed

        for (int i = 0; i < 100; ++i) {
            // Generate random 8-bit values for 'a' and 'b'
            sc_lv<8> rand_a = generate_random_8bit();
            sc_lv<8> rand_b = generate_random_8bit();

            a = rand_a;
            b = rand_b;

            wait(clk_period);
        }
    }

    // Helper function to generate random 8-bit value
    sc_lv<8> generate_random_8bit() {
        sc_lv<8> value;
        for (int i = 0; i < 8; ++i) {
            value[i] = rand() % 2; // Random binary digit (0 or 1)
        }
        return value;
    }
};


int sc_main(int argc, char* argv[]) {
    // Instantiate the modules
    fast_multiplier multiplier("multiplier_instance");
    testbench tb("testbench_instance");

    // Signals
    sc_signal<sc_lv<8>> a;
    sc_signal<sc_lv<8>> b;
    sc_signal<sc_lv<16>> output;

    // Create the clock
    sc_clock clk_tb("clk_tb", 0.7, SC_NS); // ~1.4Ghz clock which is Raspberry Pi 3B+ worst case clock speed

    // Connect the ports
    tb.clk_tb(clk_tb);
    tb.a(a);
    tb.b(b);
    tb.output(output);

    multiplier.clk(clk_tb);
    multiplier.a(a);
    multiplier.b(b);
    multiplier.output(output);

    // Set the clock period for the testbench
    tb.clk_period = clk_tb.period();

    // Run the simulation for 100 ns
    sc_start(100, SC_NS);

    return 0;
}
