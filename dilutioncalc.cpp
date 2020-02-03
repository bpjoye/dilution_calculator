// Ben Joye
// benjamin.joye@me.com & (843)991-7504
// Barron Algae
// May 15, 2018

#include <iostream>
#include <iomanip>

using namespace std;

int main(int argc, char* argv[]) {

  // input variables
  long long cellCount;
  double of250; double of500; double of750; double of150000;

  cout << endl << "Barron Algae Dilution Calculator" << endl;
  cout << "========================================================" << endl << endl;
  cout << "Enter the current cells per mL" << endl;
  cin >> cellCount;
  cout << "How much 250 percent solution do you want? (mL)" << endl;
  cin >> of250;
  cout << "How much 500 percent solution do you want? (mL)" << endl;
  cin >> of500;
  cout << "How much 750 percent solution do you want? (mL)" << endl;
  cin >> of750;
  cout << "How much 150,000 cell solution do you want? (mL)" << endl;
  cin >> of150000;
  cout << endl;
  cout << "---------------------------------------------------------------" << endl << endl;

  // inflate values to create excess
  double f250 = of250 * 1.1;
  double f500 = of500 * 1.1;
  double f750 = of750 * 1.1;
  double f150000 = of150000 * 1.02;

  double factor = cellCount / 10000000.0;

  double b250 = f250 / 3;
  double b500 = f500 / 5;
  double b750 = f750 / 7;
  double totalBase = b250 + b500 + b750;

  double algaeVolume = totalBase / (factor + 1);
  double baseDilution = algaeVolume * factor;

  // 1 part base dilution, 2 parts water
  double d250 = b250 * 2;
  // 1 part base dilution, 4 parts water
  double d500 = b500 * 4;
  // 1 part base dilution, 6 parts water
  double d750 = b750 * 6;

  // 150,000 cell dilution calculations
  double newFactor = cellCount / 150000;
  double newAlgaeVolume = f150000 / (newFactor + 1);
  double d150000 = newAlgaeVolume * newFactor;

  // total volumes
  double t250 = d250+b250;
  double t500 = d500+b500;
  double t750 = d750+b750;

  // output
  cout << "Base Dilution: " << endl << (int)baseDilution << " mL water + " << (int)algaeVolume << "mL of algae.... " << baseDilution+algaeVolume << "mL solution" << endl << endl;
  cout << "250 Percent Dilution: " << endl << d250 << " mL watera + " << b250 << "mL of base dilution.... " << t250 << "mL solution" << endl << endl;
  cout << "500 Percent Dilution: " << endl << d500 << " mL water + " << b500 << "mL of base dilution.... " << t500 << "mL solution" << endl << endl;
  cout << "750 Percent Dilution: " << endl << d750 << " mL water + " << b750 << "mL of base dilution.... " << t750 << "mL solution" << endl << endl << endl;
  cout << "150,000 Cell Dilution: " << endl << (int)d150000 << "mL water + " << (int)newAlgaeVolume << "mL of algae.... " << d150000+newAlgaeVolume << "mL solution" << endl;
  cout << endl;
  cout << "========================================================" << endl;
  cout << endl;

  return 0;
}
