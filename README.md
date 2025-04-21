# DIGITAL-FILTER-DESIGN

A digital filter is a system that processes a discrete-time input signal to produce a modified output signal, often by removing unwanted components (like noise) or enhancing desired features.

Digital filters are widely used in signal processing applications like audio processing, biomedical devices, image enhancement, and communication systems.

A FIR filter performs a weighted sum of present and past input values to produce the output. It does not use any previous output values (unlike IIR filters).

The general equation for a **Finite Impulse Response (FIR)** filter can be expressed as:

\[
y(n) = \sum_{k=0}^{M-1} h(k) \cdot x(n-k)
\]

Where:
- \( y(n) \) is the output of the filter at time index \( n \).
- \( x(n-k) \) is the input signal at time index \( n-k \).
- \( h(k) \) is the filter's impulse response (i.e., the coefficients of the filter).
- \( M \) is the number of filter taps or the order of the filter.

This equation represents the convolution of the input signal \( x(n) \) with the filter's impulse response \( h(k) \), producing the output signal \( y(n) \).
