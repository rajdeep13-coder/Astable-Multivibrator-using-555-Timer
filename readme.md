# Astable Multivibrator PCB using 555 Timer

![KiCad](https://img.shields.io/badge/Designed%20With-KiCad-blue?style=flat-square&logo=kicad)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)

---

## Objective
Design a single-layer PCB for an astable multivibrator using the NE555 timer IC.

---

## Components
- LM555-N Timer IC  
- Resistors (1kΩ, 10kΩ, 220Ω)  
- Capacitor (10µF)  
- LED  
- Power Supply (5V–9V)  

---

## Working
The circuit operates in astable mode, generating continuous pulses.  
The capacitor charges through resistors and discharges periodically, producing a square wave output.  
This output drives the LED, causing it to blink at a fixed interval.

---

## PCB Design
- Designed using KiCad  
- Single-layer PCB (bottom layer routing)  
- Compact and clean component placement  

---

## Applications
- LED flasher circuits  
- Pulse generators  
- Clock signal circuits  
- Timing applications  

---

## Project Structure
```
Astable-555-PCB/
│
├── schematic/
├── pcb/
├── images/
└── README.md
```

---

## Future Improvements
- Perform circuit simulation  
- Fabricate and test the PCB  
- Optimize routing to eliminate jumpers  
- Add silkscreen labels for clarity  

---

## License
This project is open-source and available under the MIT License.