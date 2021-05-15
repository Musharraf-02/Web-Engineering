import 'bootstrap/dist/css/bootstrap.min.css'
import React, { Component } from 'react'
export let tempDescList = []
export let tempAmountList = []
class AddTransaction extends Component {
    constructor(props) {
        super(props)
        this.state = {
            description: "",
            amount: "",
        }
    }
    render() {
        return (
            <React.Fragment>
                <h4>Add Transaction</h4>
                <hr />
                <div class="form-group" style={{ textAlign: "left" }}>
                    <label>Description:</label><br />
                    <input type="text" class="form-control" placeholder="Enter description" value={this.state.description} onChange={(e) => this.setState({ description: e.target.value })} /><br />
                    <label>Amount:</label><br />
                    <input type="number" class="form-control" placeholder="-ive -> expense, +ive -> income" value={this.state.amount} onChange={(e) => this.setState({ amount: e.target.value })} /><br />
                    <div style={{textAlign:"center"}}><button style={{margin:"auto"}}class="btn btn-outline-info" onClick={() => {
                        if (this.state.description == "" || this.state.amount == "" || this.state.amount == 0) {
                            if (this.state.description == "") {
                                alert("Error! Enter a valid description!")
                            }
                            else {
                                alert("Error! Enter a valid amount!")
                            }
                        }
                        else {
                            tempDescList = this.props.passedComponent.state.descriptionList
                            tempAmountList = this.props.passedComponent.state.amountList
                            tempDescList.push(this.state.description)
                            tempAmountList.push(this.state.amount)
                            this.props.passedComponent.updateTransactions()
                            tempDescList = []
                            tempAmountList = []
                            this.setState({ description: "", amount: "" })
                        }
                    }}>Add</button></div><br />
                </div>
            </React.Fragment>
        )
    }
}
export default AddTransaction