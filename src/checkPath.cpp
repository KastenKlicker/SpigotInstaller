// author KastenKlicker

#include <string>

using namespace std;

int main(int argc, char* argv[]) {

    //Check if parameter is given
    if (argc < 1) return 3;

    //Check if a substring from error_path[] is in the first parameter
    string path = argv[1];
    string error_path[7] = {"OneDrive", "Dropbox", "'", "#", "~", "(", ")"};

    for(int i = 0; i < 7; i++)
    {   
        if (path.find(error_path[i]) != string::npos) return 1;
    }

    return 0;

}