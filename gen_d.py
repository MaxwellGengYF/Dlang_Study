ss = '''
void func#()
{}'''
for i in range(1000):
    f = open("mod_" + str(i) + ".d", "w")
    f.write(ss.replace("#", str(i)))
    f.close()