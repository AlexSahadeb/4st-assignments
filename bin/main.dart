void main() {
  var savings = SavingsAccount(12345, 1000.0, 0.05);
  savings.deposit(500.0);
  savings.withdraw(200.0);
  var current = CurrentAccount(67890, 2000.0, 1000.0);
  current.deposit(800.0);
  current.withdraw(3000.0);
}

abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$$amount');
    print('New Balance: \$$balance');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      balance += balance * interestRate;
      print('Withdrawn: \$$amount');
      print('New Balance: \$$balance');
    } else {
      print('Insufficient funds');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance + overdraftLimit >= amount) {
      balance -= amount;
      print('Withdrawn: \$$amount');
      print('New Balance: \$$balance');
    } else {
      print('Insufficient funds');
    }
  }
}


