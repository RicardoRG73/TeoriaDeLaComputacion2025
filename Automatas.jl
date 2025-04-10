### A Pluto.jl notebook ###
# v0.20.5

using Markdown
using InteractiveUtils

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

# ╔═╡ 1694152d-ab2b-4751-bcc5-21ca8fb92f2a
begin
	A = ["aba", "abb"]
	B = ["ab", "bb"]
	function concatenacion(A,B)
		[cadena_A * cadena_B for cadena_A in A for cadena_B in B]
	end
	concatenacion(A,B)
end

# ╔═╡ b534ae99-ec66-48e8-9f00-f33559495a6a


# ╔═╡ 28dbd317-4548-4ab6-902b-a11796c8bada
[elem for elem in 1:5]

# ╔═╡ a404b63c-3396-459f-93d3-50a1e4e2562b
[elem * k for elem in 1:5 for k in 2:2:6]

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
# ╠═af8c8434-14a5-11f0-2eb7-a3f6932bfe96
# ╠═f008773b-4b57-4bf0-ba07-f085af1c1d75
# ╠═1a5f4164-9352-408b-b642-a7ed48257701
# ╠═ddcd6369-e089-4ada-821b-d5858ecc92c5
# ╠═81ae00e6-bb14-43da-b37a-a0221261fb9f
# ╠═adfc2d30-bf09-4fd1-b4fc-b4467e01c918
# ╠═81b851bb-fd9e-4108-b796-2ffdc93434d8
# ╠═1694152d-ab2b-4751-bcc5-21ca8fb92f2a
# ╠═b534ae99-ec66-48e8-9f00-f33559495a6a
# ╠═28dbd317-4548-4ab6-902b-a11796c8bada
# ╠═a404b63c-3396-459f-93d3-50a1e4e2562b
# ╟─1f924810-88ff-4775-9eef-d54d6e78c4fc
# ╟─7cc74817-f803-4117-a3d2-1bf34fca907e
# ╠═fb6a0c80-d629-40cf-b13c-00b42d5d05c1
# ╠═31b42732-08b2-4070-845a-e2edb36cf28f
# ╠═c467ce56-5e75-475c-8e46-a06c30dba347
