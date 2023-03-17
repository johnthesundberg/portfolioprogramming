import random
keysdict = [["A","B","C#","D","E","F#","G#"],["A","Bb","C","D","Eb","F","G"],["A#","B","C#","D#","E","F#","G#"],["A","B","C","D","E","F","G"],["Ab","Bb","C","Db","Eb","F","Gb"],["A","B","C#","D","E","F#","G"],["Ab","Bb","C","D","Eb","F","G"],["A","B","C#","D#","E","F#","G#"],["A","Bb","C","D","E","F","G"],["Ab","Bb","Cb","Db","Eb","F","Gb"],["A","B","C","D","E","F#","G"],["Ab","Bb","C","Db","Eb","F","G"]]
line1 = ["--------"]
line2 = [" /`*, O "]
line3 = ["0---|---"]
line4 = ["    | O "]
line5 = ["---|----"]
line6 = ["   |    "]
line7 = ["--|-----"]
line8 = [" o      "]
line9 = ["--------"]
notes = keysdict[random.randint(0,11)]
if notes == keysdict[0]:
  line1.append("---------")
  line2.append("   #     ")
  line3.append("-#-------")
  line4.append("         ")
  line5.append("---------")
  line6.append("  #      ")
  line7.append("---------")
  line8.append("         ")
  line9.append("---------")
elif notes == keysdict[1]:
  line1.append("---------")
  line2.append("         ")
  line3.append("---------")
  line4.append("  b      ")
  line5.append("---------")
  line6.append("         ")
  line7.append("-b-------")
  line8.append("         ")
  line9.append("---------")
elif notes == keysdict[2]:
  line1.append("---------")
  line2.append("   #     ")
  line3.append("-#-------")
  line4.append("         ")
  line5.append("----#----")
  line6.append("  #      ")
  line7.append("---------")
  line8.append("     #   ")
  line9.append("---------")
elif notes == keysdict[3]:
  line1.append("---------")
  line2.append("         ")
  line3.append("---------")
  line4.append("         ")
  line5.append("---------")
  line6.append("         ")
  line7.append("---------")
  line8.append("         ")
  line9.append("---------")
elif notes == keysdict[4]:
  line1.append("---------")
  line2.append("     b   ")
  line3.append("---------")
  line4.append("  b      ")
  line5.append("----b----")
  line6.append("         ")
  line7.append("-b-------")
  line8.append("   b     ")
  line9.append("---------")
elif notes == keysdict[5]:
  line1.append("---------")
  line2.append("         ")
  line3.append("-#-------")
  line4.append("         ")
  line5.append("---------")
  line6.append("  #      ")
  line7.append("---------")
  line8.append("         ")
  line9.append("---------")
elif notes == keysdict[6]:
  line1.append("---------")
  line2.append("         ")
  line3.append("---------")
  line4.append("  b      ")
  line5.append("---------")
  line6.append("         ")
  line7.append("-b-------")
  line8.append("   b     ")
  line9.append("---------")
elif notes == keysdict[7]:
  line1.append("---------")
  line2.append("   #     ")
  line3.append("-#-------")
  line4.append("         ")
  line5.append("----#----")
  line6.append("  #      ")
  line7.append("---------")
  line8.append("         ")
  line9.append("---------")
elif notes == keysdict[8]:
  line1.append("---------")
  line2.append("         ")
  line3.append("---------")
  line4.append("         ")
  line5.append("---------")
  line6.append("         ")
  line7.append("-b-------")
  line8.append("         ")
  line9.append("---------")
elif notes == keysdict[9]:
  line1.append("---------")
  line2.append("     b   ")
  line3.append("---------")
  line4.append("  b      ")
  line5.append("----b----")
  line6.append("      b  ")
  line7.append("-b-------")
  line8.append("   b     ")
  line9.append("---------")
elif notes == keysdict[10]:
  line1.append("---------")
  line2.append("         ")
  line3.append("-#-------")
  line4.append("         ")
  line5.append("---------")
  line6.append("         ")
  line7.append("---------")
  line8.append("         ")
  line9.append("---------")
elif notes == keysdict[11]:
  line1.append("---------")
  line2.append("         ")
  line3.append("---------")
  line4.append("  b      ")
  line5.append("----b----")
  line6.append("         ")
  line7.append("-b-------")
  line8.append("   b     ")
  line9.append("---------")
melodylength = random.randint(5,20)
melody = []
startingnote = random.randint(0,6)
for i in range(melodylength):
  melody.append(notes[startingnote])
  interval = random.randint(1,8)
  startingnote = startingnote + interval
  if startingnote > 6:
    startingnote = startingnote - 8

  

for i in melody:
  length = random.randint(1,4);
  head = " "
  stem = " "
  stem2 = "-"
  flag = " "
  flag2 = "-"
  if length == 1:
    head = "0"
    stem = "|"
    stem2 = "|"
    flag = ")"
    flag2 = ")"
  elif length == 2:
    head = "0"
    stem = "|"
    stem2 = "|"
  elif length == 3:
    head = "O"
    stem = "|"
    stem2 = "|"
  else:
    head = "O"
  if "A" in i:
    line1.append("-----")
    line2.append("     ")
    line3.append("-----")
    line4.append("   "+stem+flag)
    line5.append("---"+stem2+"-")
    line6.append("   "+stem+" ")
    line7.append("---"+stem2+"-")
    line8.append("  "+head+"  ")
    line9.append("-----")
  elif "B" in i:
    line1.append("-----")
    line2.append("     ")
    line3.append("---"+stem2+flag2)
    line4.append("   "+stem+" ")
    line5.append("---"+stem2+"-")
    line6.append("   "+stem+" ")
    line7.append("--"+head+"--")
    line8.append("     ")
    line9.append("-----")
  elif "C" in i:

    line1.append("-----")
    line2.append("   "+stem+flag)
    line3.append("---"+stem2+"-")
    line4.append("   "+stem+" ")
    line5.append("---"+stem2+"-")
    line6.append("  "+head+"  ")
    line7.append("-----")
    line8.append("     ")
    line9.append("-----")
  elif "D" in i:
    line1.append("---"+stem2+flag2)
    line2.append("   "+stem+" ")
    line3.append("---"+stem2+"-")
    line4.append("   "+stem+" ")
    line5.append("--"+head+"--")
    line6.append("     ")
    line7.append("-----")
    line8.append("     ")
    line9.append("-----")
  elif "E" in i:
    line1.append("-----")
    line2.append("     ")
    line3.append("-----")
    line4.append("  "+head+"  ")
    line5.append("-"+stem2+"---")
    line6.append(" "+stem+"   ")
    line7.append("-"+stem2+"---")
    line8.append(" "+stem+flag+"  ")
    line9.append("-----")
  elif "F" in i:
    line1.append("-----")
    line2.append("     ")
    line3.append("--"+head+"--")
    line4.append(" "+stem+"   ")
    line5.append("-"+stem2+"---")
    line6.append(" "+stem+"   ")
    line7.append("-"+stem2+"---")
    line8.append("     ")
    line9.append("-----")
  elif "G" in i:

    line1.append("-----")
    line2.append("  "+head+"  ")
    line3.append("-"+stem2+"---")
    line4.append(" "+stem+"   ")
    line5.append("-"+stem2+"---")
    line6.append(" "+stem+flag+"  ")
    line7.append("-----")
    line8.append("     ")
    line9.append("-----")
print("".join(line1))
print("".join(line2))
print("".join(line3))
print("".join(line4))
print("".join(line5))
print("".join(line6))
print("".join(line7))
print("".join(line8))
print("".join(line9))