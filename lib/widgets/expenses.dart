import 'package:my_app/widgets/chart/chart.dart';
import 'package:my_app/widgets/expenses_list/expenses_list.dart';
import 'package:my_app/models/expense.dart';
import 'package:my_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
      isScrollControlled: true,
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    int expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense Deleted'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

final List<Expense> _registeredExpenses = [
  Expense(
    title: 'Cheeseburger',
    amount: 12.45,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
    title: 'Chicken Sandwich',
    amount: 10.90,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
    title: 'Vegan Burger',
    amount: 13.75,
    date: DateTime.now(),
    category: Category.food,
  ),

  Expense(
    title: 'Movie Ticket',
    amount: 18.99,
    date: DateTime.now(),
    category: Category.leisure,
  ),
  Expense(
    title: 'Sports Game',
    amount: 45.00,
    date: DateTime.now(),
    category: Category.leisure,
  ),
  Expense(
    title: 'Tech Expo',
    amount: 65.00,
    date: DateTime.now(),
    category: Category.leisure,
  ),

  Expense(
    title: 'Plane Ticket',
    amount: 280.00,
    date: DateTime.now(),
    category: Category.travel,
  ),
  Expense(
    title: 'Train Ticket',
    amount: 34.00,
    date: DateTime.now(),
    category: Category.travel,
  ),
  Expense(
    title: 'Ferry Ticket',
    amount: 22.50,
    date: DateTime.now(),
    category: Category.travel,
  ),

  Expense(
    title: 'Office Supplies',
    amount: 29.99,
    date: DateTime.now(),
    category: Category.work,
  ),
  Expense(
    title: 'Wireless Headset',
    amount: 20.00,
    date: DateTime.now(),
    category: Category.work,
  ),
  Expense(
    title: 'Printer Ink',
    amount: 55.00,
    date: DateTime.now(),
    category: Category.work,
  ),
];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("Click the + button to add an Expense!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child:Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}