#include <iostream>
#include <fstream>
#include <vector>
#include <ctime>
#include <chrono>
#include <omp.h>

using namespace std;


vector<double> Izračun(int št_točk, vector<vector<double>> A, vector<double> b, vector<double> T, int iteracije = 2000) {

#pragma omp parallel
    {
#pragma omp for
        for (int i = 0; i < iteracije; i++) {

#pragma omp parallel
            {
#pragma omp for
                for (int i = 0; i < št_točk; i++) {

                    double sum = 0;

                    for (int j = 0; j < št_točk; j++) {

                        if (i != j) sum += A[i][j] * T[j];
                    }
                    T[i] = (b[i] - sum) / A[i][i];
                }
            }
        }
    }
    return T;
}


int main() {

    char ch;
    int št_točk;
    double vrednost;

    ifstream file;
    file.open("datoteka_A_b.txt", ios::in);

    if (file.is_open()) {

        for (int i = 0; i < 4; i++) file >> ch;
        file >> št_točk;

        vector<vector<double>> A;

        for (int i = 0; i < št_točk; i++) {

            vector<double> A_vrst;
            for (int j = 0; j < št_točk; j++) {

                file >> vrednost;
                if (j < št_točk - 1) file >> ch;
                A_vrst.push_back(vrednost);
            }
            A.push_back(A_vrst);
        }

        for (int i = 0; i < 5; i++) file >> ch;
        file >> št_točk;

        vector<double> b;

        for (int i = 0; i < št_točk; i++) {

            file >> vrednost;
            b.push_back(vrednost);
        }


        vector<double> T(št_točk, 100);

        auto čas0 = chrono::high_resolution_clock::now();

        T = Izračun(št_točk, A, b, T);

        auto čas1 = chrono::high_resolution_clock::now();
        chrono::duration<double> čas_razlika = čas1 - čas0;

        cout << "Gauss-Seidel metoda: " << čas_razlika.count() << " s" << endl;
        cout << "Največja temperatura: " << *max_element(T.begin(), T.end()) << " C" << endl;
    }

    else cout << "Datoteka ni bila uspešno odprta\n";
}
