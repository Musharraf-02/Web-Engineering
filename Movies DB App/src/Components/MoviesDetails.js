import React, { useState } from 'react'
import 'bootstrap/dist/css/bootstrap.min.css';
import { moviesList } from './movies.js'
import { genres } from './movies.js'
const MoviesDetails = () => {
    let [type, setType] = useState("")
    let prevType = ""
    return (
        <div id="my-div" class="container-fluid">
            <div id="genre-div">
                <button class="btn btn-primary" style={{ margin: 5 }} id="All" onClick={(e) => {
                    prevType = type
                    setType(e.target.id)
                }}>All</button>
                {
                    genres.map(type => {
                        return (<button class="btn btn-primary" style={{ margin: 5 }} id={type} onClick={(e) => {
                            prevType = type
                            setType(e.target.id)
                        }}>{type}</button>)
                    })
                }
            </div>
            <div class="container-fluid">
            <div id="movies-div" class="row">
                {
                    moviesList.map(movie => {
                        if (type != prevType) {
                            if (type == "All") {
                                return (<div class="col-12 col-md-4"><div class="card" style={{marginTop:15,marginBottom:15}}><div class="card-header" style={{border:"none",backgroundColor:"transparent"}}><b>{movie.title}</b></div><div class="card-body"><b>{movie.year}</b></div><div class="card-footer"  style={{border:"none",backgroundColor:"transparent"}}>{movie.genre}</div></div></div>)
                            }
                            else if (movie.genre == type) {
                                return (<div class="col-12 col-md-4"><div class="card" style={{marginTop:15,marginBottom:15}}><div class="card-header" style={{border:"none",backgroundColor:"transparent"}}><b>{movie.title}</b></div><div class="card-body"><b>{movie.year}</b></div><div class="card-footer"  style={{border:"none",backgroundColor:"transparent"}}>{movie.genre}</div></div></div>)
                            }
                        }
                    })
                }
            </div>
            </div>

        </div>
    )
}
export default MoviesDetails