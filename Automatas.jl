### A Pluto.jl notebook ###
# v0.20.5

using Markdown
using InteractiveUtils

# ╔═╡ c8c8b862-4876-4c51-8fe3-b84cbf2e7b19
md"# Conprenhentions"

# ╔═╡ 79b2cc2d-b57a-4f89-a39c-ba468b2c13f8
md"## Creando un vector"

# ╔═╡ db0c9e40-98e0-4bba-b4c6-cfeed394fbea
begin
	vec = []
	for elem in 1:5
		append!(vec, elem)
	end
	vec
end

# ╔═╡ 28dbd317-4548-4ab6-902b-a11796c8bada
[elem for elem in 1:5]

# ╔═╡ fb1f4842-75aa-4587-ac55-c7c944ff4f4d
md"## Creando una matriz"

# ╔═╡ ac2b3718-51bc-45a5-a063-c4122bda6659
begin
	vec2 = []
	for elem in 1:5
		for k in 2:2:6
			append!(vec2, elem * k)
		end
	end
	vec2
end

# ╔═╡ a404b63c-3396-459f-93d3-50a1e4e2562b
[elem * k for elem in 1:5 for k in 2:2:6]

# ╔═╡ a6d3d97c-9beb-48af-9cfe-177e710d36b5
begin
	mat = zeros(5,3)
	i = 1
	for elem in 1:5
		j = 1
		# println("k = $i")
		for k in 2:2:6
			# println("j = $j")
			mat[i,j] = elem * k
			j += 1
		end
		i += 1
	end
	mat
end

# ╔═╡ e5231005-4355-43bb-81d1-93bdebeefb9e
begin
	vec3 = [elem * k for elem in 1:5 for k in 2:2:6]
	mat3 = reshape(vec3, 5, 3)
end

# ╔═╡ 677e5106-2200-47d6-a058-98f83a5cce9e
md"# Lenguajes"

# ╔═╡ b4fe360b-8893-46e3-bf7b-a27950398893
"""
Concatenación de lenguajes `A`, `B`.

```
julia> A = [\"aba\", \"abb\"]
julia> B = [\"ab\", \"bb\"]
julia> concatenacion(A,B)
4-element Vector{String}:
 \"abaab\"
 \"ababb\"
 \"abbab\"
 \"abbbb\"
```
"""
function concatenacion(A,B)
	return [cadena_A * cadena_B for cadena_A in A for cadena_B in B]
end

# ╔═╡ 1694152d-ab2b-4751-bcc5-21ca8fb92f2a
begin
	A = ["aba", "abb"]
	B = ["ab", "bb"]
	concatenacion(A,B)
end

# ╔═╡ 7e1d9ebb-9d93-468f-b417-ae8abd7afe3f
function potencia(A, n::Int)
	concat = A
	if n == 0 # potencia 0 (A⁰)
		concat = [""]
	elseif n == 1 # potencia 1 (A¹)
		return concat
	else
		for i in 2:n # sigientes potencias (A², A³, …)
			concat = concatenacion(concat,A)
		end
	end
	return concat
end

# ╔═╡ 5174e2be-cbf5-4f7f-8fef-9b14b71a3aae
# test de la función potencia
potencia(A, 2)

# ╔═╡ 5647a1fc-161f-4d6c-9b00-0a86ac998ec0
md"# Automatas finitos"

# ╔═╡ af8c8434-14a5-11f0-2eb7-a3f6932bfe96
# Función de transición δ
δ = Dict(
	("q0", 'a') => "q0",
	("q0", "") => "q0"
)

# ╔═╡ f008773b-4b57-4bf0-ba07-f085af1c1d75
# Estados de aceptación F
F = ["q0"]

# ╔═╡ 1a5f4164-9352-408b-b642-a7ed48257701
# Estado inicial
q = "q0"

# ╔═╡ ddcd6369-e089-4ada-821b-d5858ecc92c5
"""
Esta función simula un AFD que procesa la cadena `u`.

# Entrada

δ: Diccionario Función de transición.

F: Vector de estados de aceptación.

q: String del estado inicial.

u: String, cadena de entrada.

# Salida

true: Si la cadena u es aceptada.

false: Si la cadena u es rechazada.
"""
function AFD_a🌟(δ, F, q, u)
	for s in u
		key = (q,s)
		if haskey(δ,key)
			q = δ[key]
		else
			return false
		end
	end
	if q in F
		return true
	else
		return false
	end
end

# ╔═╡ 81ae00e6-bb14-43da-b37a-a0221261fb9f
begin
	u = "aabaa"
	resultado = AFD_a🌟(δ, F, q, u)
end

# ╔═╡ adfc2d30-bf09-4fd1-b4fc-b4467e01c918
if resultado
	"La cadena $u se acepta"
else
	"La cadena $u se rechaza"
end

# ╔═╡ 81b851bb-fd9e-4108-b796-2ffdc93434d8
begin
	lista = ["","a","aa","a"^3, "a"^4, "a"^5, "aba"]
	for cadena in lista
		res = AFD_a🌟(δ, F, q, cadena)
		if res
			println("La cadena \"$cadena\" se acepta")
		else
			println("La cadena \"$cadena\" se rechaza")
		end
	end
end

# ╔═╡ b534ae99-ec66-48e8-9f00-f33559495a6a


# ╔═╡ 1f924810-88ff-4775-9eef-d54d6e78c4fc


# ╔═╡ 7cc74817-f803-4117-a3d2-1bf34fca907e
md"# Tests"

# ╔═╡ fb6a0c80-d629-40cf-b13c-00b42d5d05c1
δ[("q0", "")] ∈ F

# ╔═╡ 31b42732-08b2-4070-845a-e2edb36cf28f
"q0" ∈ F

# ╔═╡ c467ce56-5e75-475c-8e46-a06c30dba347
"q0" in F

# ╔═╡ Cell order:
# ╠═c8c8b862-4876-4c51-8fe3-b84cbf2e7b19
# ╠═79b2cc2d-b57a-4f89-a39c-ba468b2c13f8
# ╠═db0c9e40-98e0-4bba-b4c6-cfeed394fbea
# ╠═28dbd317-4548-4ab6-902b-a11796c8bada
# ╠═fb1f4842-75aa-4587-ac55-c7c944ff4f4d
# ╠═ac2b3718-51bc-45a5-a063-c4122bda6659
# ╠═a404b63c-3396-459f-93d3-50a1e4e2562b
# ╠═a6d3d97c-9beb-48af-9cfe-177e710d36b5
# ╠═e5231005-4355-43bb-81d1-93bdebeefb9e
# ╠═677e5106-2200-47d6-a058-98f83a5cce9e
# ╠═b4fe360b-8893-46e3-bf7b-a27950398893
# ╠═1694152d-ab2b-4751-bcc5-21ca8fb92f2a
# ╠═7e1d9ebb-9d93-468f-b417-ae8abd7afe3f
# ╠═5174e2be-cbf5-4f7f-8fef-9b14b71a3aae
# ╠═5647a1fc-161f-4d6c-9b00-0a86ac998ec0
# ╠═af8c8434-14a5-11f0-2eb7-a3f6932bfe96
# ╠═f008773b-4b57-4bf0-ba07-f085af1c1d75
# ╠═1a5f4164-9352-408b-b642-a7ed48257701
# ╠═ddcd6369-e089-4ada-821b-d5858ecc92c5
# ╠═81ae00e6-bb14-43da-b37a-a0221261fb9f
# ╠═adfc2d30-bf09-4fd1-b4fc-b4467e01c918
# ╠═81b851bb-fd9e-4108-b796-2ffdc93434d8
# ╠═b534ae99-ec66-48e8-9f00-f33559495a6a
# ╟─1f924810-88ff-4775-9eef-d54d6e78c4fc
# ╟─7cc74817-f803-4117-a3d2-1bf34fca907e
# ╠═fb6a0c80-d629-40cf-b13c-00b42d5d05c1
# ╠═31b42732-08b2-4070-845a-e2edb36cf28f
# ╠═c467ce56-5e75-475c-8e46-a06c30dba347
