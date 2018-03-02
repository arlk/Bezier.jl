# Bezier

[![Build Status](https://travis-ci.org/arlk/Bezier.jl.svg?branch=master)](https://travis-ci.org/arlk/Bezier.jl) [![codecov](https://codecov.io/gh/arlk/Bezier.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/arlk/Bezier.jl)

This package provides evaluation and subdivision algorithms for arbitary order Bezier curves.

## Usage

Evaluate curve at `0.5`:
```julia-repl
julia> pts = [0.0 1.0 2.0 3.0; 0.0 -1.0 2.0 0.0];
julia> evalbezier(pts, 0.5)
2-element Array{Float64,1}:
  1.5
  0.375
```

*Note*: You can perform evaluations much faster if you use [StaticArrays.jl](https://github.com/JuliaArrays/StaticArrays.jl)

Evaluate curve at `0.1:0.01:1.0`:
```julia-repl
julia> evalbezier(pts, 0.1:0.01:1.0)
2×91 Array{Float64,2}:
  0.3     0.33       0.36       0.39       0.42      …  2.88      2.91      2.94      2.97      3.0
 -0.189  -0.196779  -0.202752  -0.206973  -0.209496     0.216576  0.166743  0.114072  0.058509  0.0
```

Subdivide curve at `0.5`:
```julia-repl
julia> β₁, β₂ = subdivide(pts, 0.5)
([0.0 0.5 1.0 1.5; 0.0 -0.5 0.0 0.375], [1.5 2.0 2.5 3.0; 0.375 0.75 1.0 0.0])
```
