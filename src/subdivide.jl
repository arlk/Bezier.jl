"""
    decasteljau(control, t)

Evaluate de Casteljau's algorithm.
"""
function decasteljau(control::AbstractArray{T,2}, t::T) where {T<:AbstractFloat}
    n = size(control, 2) - 1
    β = zeros(size(control, 1), n+1, n+1)
    @inbounds β[:,:,1] = control
    for j = 2:n+1, i = 1:n-j+2
        @inbounds β[:,i,j] = β[:,i,j-1]*(1-t) + β[:,i+1,j-1]*t
    end
    β
end

"""
    subdivide(control, t)

Subdivide a Bezier curve using de Casteljau's algorithm.
"""
function subdivide(control::AbstractArray{T,2}, t::T) where {T<:AbstractFloat}
    β = decasteljau(control, t)
    β₁ = β[:,1,:]
    β₂ = zeros(control)
    n = size(control, 2) - 1
    for i = 1:n+1
        @inbounds β₂[:,i] = β[:,i,n-i+2]
    end
    β₁, β₂
end
