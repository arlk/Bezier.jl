"""
    evalbezier(control, t)

Evaluate a Bezier curve using Horner's method.
"""
function evalbezier(control::AbstractArray{T,2}, t::T) where {T<:AbstractFloat}
    # Horner's method
    tᶜ = 1.0 - t
    tᵢ = 1.0
    cᵢ = 1.0
    bᵢ = control[:, 1]*tᶜ
    n = size(control, 2) - 1
    for i in 1:n-1
        tᵢ = tᵢ*t
        cᵢ = (n-i+1)*cᵢ/i
        bᵢ = (bᵢ+ cᵢ*control[:, i+1]*tᵢ)*tᶜ
    end
    bᵢ + control[:, n+1]*tᵢ*t
end

"""
    evalbezier(control, tvec)

Evaluate along at array of time instants.
"""
function evalbezier(control::AbstractArray{T,2}, tvec::AbstractArray{T, 1}) where {T<:AbstractFloat}
    # TODO Just a hack (only really meant for viz)
    p = zeros(size(control, 1), size(tvec, 1))
    for (i,t) in enumerate(tvec)
        p[:,i] = evalbezier(control, t)
    end
    p
end
