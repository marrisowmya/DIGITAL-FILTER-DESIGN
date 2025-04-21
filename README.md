# DIGITAL-FILTER-DESIGN

A digital filter is a system that processes a discrete-time input signal to produce a modified output signal, often by removing unwanted components (like noise) or enhancing desired features.

Digital filters are widely used in signal processing applications like audio processing, biomedical devices, image enhancement, and communication systems.

A FIR filter performs a weighted sum of present and past input values to produce the output. It does not use any previous output values (unlike IIR filters).

The output y[n] of an FIR filter is calculated as:
 
          k=0
y[n]=      ∑     h[k]⋅x[n−k]

          N−1

y[n] = output signal at time n
x[n] = input signal at time n
h[k] = filter coefficient (impulse response) at position k
N = number of taps (length of the filter)

