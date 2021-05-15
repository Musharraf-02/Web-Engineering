import 'bootstrap/dist/css/bootstrap.min.css'
import React, { Component } from 'react'
import { tempAmountList } from './AddTransaction';
import ListTransactions from './ListTransactions';
class ExpenseTracker extends Component {
    constructor(props) {
        super(props)
        this.state = {
            balance: 0,
            income: 0,
            expense: 0
        }
    }
    setIncomeAndExpense() {
        let inc = 0, exp = 0
        for (let i = 0; i < tempAmountList.length; i++) {
            if (tempAmountList[i] > 0) {
                inc = inc + parseInt(tempAmountList[i])
            }
            else {
                exp = exp + parseInt(tempAmountList[i])
            }
        }
        this.setState({ income: inc, expense: exp })
    }
    setBalance() {
        var bal = 0
        for (let i = 0; i < tempAmountList.length; i++) {
            if (tempAmountList[i] > 0) {
                bal = bal + parseInt(tempAmountList[i])
            }
            else {
                bal = bal + parseInt(tempAmountList[i])
            }
        }
        this.setState({ balance: bal })
    }
    render() {
        return (
            <React.Fragment>
                <div class="container">
                    <div class="row ">
                        <div class="col-xs-3 mx-auto text-center" >
                            <h1 style={{ fontFamily: "'Bradley Hand', cursive" }}>Expense Tracker</h1>
                            <h2 style={{ fontFamily: "'Bradley Hand', cursive" }}>Balance: ${this.state.balance}</h2>

                            <table style={{ marginLeft: "auto", marginRight: "auto" }}>
                                <tr style={{ border: "1px solid", backgroundColor: "#20B2AA", color: "white" }}><td style={{ borderRight: "1px solid white", paddingRight: "20px", paddingLeft: "20px" }}>Income<br />${this.state.income}</td><td style={{ paddingLeft: "20px", paddingRight: "20px" }}>Expense<br />${this.state.expense*-1}</td></tr>
                            </table>
                            <br />

                            <ListTransactions passedExpenseTrackerFunction={this.setIncomeAndExpense.bind(this)} passedBalanceFunction={this.setBalance.bind(this)} passed={this} />
                        </div>
                    </div>
                </div>
            </React.Fragment>
        )
    }
}
export default ExpenseTracker