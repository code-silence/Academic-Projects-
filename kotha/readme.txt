# 📝 KOTHA – A Bangla Interpreter  

**KOTHA** is a simple Bangla-based interpreter built using **Flex** and **Bison**.  
The goal of this project is to create a programming language that uses Bangla keywords,  
making coding feel more natural and friendly for Bangla speakers.  

🚧 **Note:** This project is still under active development. Expect frequent updates and improvements.  

---

## ✨ Features (so far)
- Support for variable declaration (`RAKHUN`)  
- Print statements (`DEKHAO`, `BOLO`)  
- Basic arithmetic operations (+, -, *, /)  
- Conditional execution with `JODI` (if) and `NOILE` (else)  

---

## 🛠️ How to Build & Run

### Requirements
- **Flex** (Lexical Analyzer)  
- **Bison** (Parser Generator)  
- **GCC** (or any C compiler)  

### Build
```bash
bison -d bangla.y
flex bangla.l
gcc -o kotha bangla.tab.c lex.yy.c -mconsole
app.exe
