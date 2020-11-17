// author KastenKlicker

#include <string>

using namespace std;

int main(int argc, char* argv[]) {

    //Check if parameter is given
    if (argc < 1) return 3;

    //Execute BuildTools.jar
    string command_str = "java -jar BuildTools.jar --rev ";

    command_str.append(argv[1]);

    const char* command = command_str.c_str();

    system(command);
    return 0;

}