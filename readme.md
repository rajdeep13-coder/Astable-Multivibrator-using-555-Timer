# Astable Multivibrator PCB using 555 Timer

![KiCad](https://img.shields.io/badge/Designed%20With-KiCad-blue?style=flat-square&logo=kicad)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow?style=flat-square)

---

## Objective
Design a single-layer PCB for an astable multivibrator using the LM555-N timer IC.

---

## Components
- LM555-N Timer IC  
- Resistors (1kΩ, 10kΩ, 220Ω)  
- Capacitor (1µF)  
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
- Single-layer target (implementation in progress)  
- Component footprints are being assigned and synchronized to PCB  

---

## Applications
- LED flasher circuits  
- Pulse generators  
- Clock signal circuits  
- Timing applications  

---

## Project Structure
```
Astable_555_PCB/
|
|-- Astable_555_PCB.kicad_sch
|-- Astable_555_PCB.kicad_pcb
|-- Astable_555_PCB.kicad_pro
|-- Astable_555_PCB.kicad_prl
|-- ERC.rpt
|-- report.txt
|-- readme.md
`-- Astable_555_PCB-backups/
```

---

## Current Gaps
- Complete footprint assignment for all schematic components  
- Update PCB from schematic and place all footprints  
- Route board and define Edge.Cuts outline  
- Re-run ERC/DRC until there are no blocking errors  
- Export manufacturing files (Gerber + drill), BOM, and assembly data  

---

## Future Improvements
- Perform circuit simulation  
- Fabricate and test the PCB  
- Add silkscreen labels for clarity  

---

## License
This project is open-source and available under the MIT License.