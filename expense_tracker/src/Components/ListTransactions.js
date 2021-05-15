import 'bootstrap/dist/css/bootstrap.min.css'
import React, { Component } from 'react'
import { tempDescList, tempAmountList } from './AddTransaction';
import AddTransaction from './AddTransaction';
let transactionsCount = 0
class ListTransaction extends Component {
    constructor(props) {
        super(props)
        this.state = {
            descriptionList: [],
            amountList: [],
        }
    }
    updateTransactions() {
        this.setState({
            descriptionList: tempDescList,
            amountList: tempAmountList,
        })
        this.props.passedExpenseTrackerFunction()
        this.props.passedBalanceFunction()
        transactionsCount = 0
    }
    displayWarning() {
        if (this.state.descriptionList.length == 0) {
            return (<span>No transactions added yet!</span>)
        }
    }
    render() {
        return (
            <React.Fragment>
                <h4>Transaction History</h4>
                <hr />
                <div>
                    {this.displayWarning()}
                    {
                        this.state.descriptionList.map((item, index) => {
                            transactionsCount++
                            let classType = "", borderCol = ""
                            if (this.state.amountList[index] < 0) {
                                classType = "btn btn-danger"
                                borderCol = "1px solid red"
                            }
                            else {
                                classType = "btn btn-success"
                                borderCol = "1px solid green"
                            }
                            return (<div class="row" style={{ border: borderCol, borderRadius: "5px" }}><div class="col-6 text-left">{item}</div><div class="col-6 text-right" style={{ padding: 0 }}>{this.state.amountList[index]}<button id={transactionsCount} class={classType} onClick={e => {
                                let descArray = [], amountArray = []
                                for (let i = 0; i < this.state.descriptionList.length; i++) {
                                    if (i != (e.target.id - 1)) {
                                        descArray.push(this.state.descriptionList[i])
                                        amountArray.push(this.state.amountList[i])
                                    }
                                    transactionsCount = 0
                                }
                                this.setState({ descriptionList: descArray, amountList: amountArray })
                                this.props.passed.setState({ balance: 0, income: 0, expense: 0 })
                                let inc = 0, exp = 0, bal = 0
                                for (let i = 0; i < amountArray.length; i++) {
                                    if (amountArray[i] > 0) {
                                        inc = inc + parseInt(amountArray[i])
                                    }
                                    else {
                                        exp = exp + parseInt(amountArray[i])
                                    }
                                }
                                for (let i = 0; i < amountArray.length; i++) {
                                    if (amountArray[i] > 0) {
                                        bal = bal + parseInt(amountArray[i])
                                    }
                                    else {
                                        bal = bal + parseInt(amountArray[i])
                                    }
                                }
                                this.props.passed.setState({ income: inc, expense: exp, balance: bal })
                            }}>X</button></div><br /></div>)
                        })
                    }
                    <br /><br /><br /><br />
                </div>
                <AddTransaction passedComponent={this} />
            </React.Fragment>
        )
    }
}
export default ListTransaction