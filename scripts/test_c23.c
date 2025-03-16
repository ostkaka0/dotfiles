

#define Option(T) struct {T val;}

int main() {
    Option(int) x = {7};
    Option(int) y = {5};
    Option(int) z = x;
    return 0;
}
