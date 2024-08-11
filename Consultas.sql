--1 Buscar o nome e ano dos filmes
SELECT [Id],[Nome],[Ano] 
FROM [Filmes].[dbo].[Filmes]

--2 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT [Id],[Nome],[Ano],Duracao 
FROM [Filmes].[dbo].[Filmes] 
ORDER BY Ano ASC

--3 Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT [Id],[Nome],[Ano],Duracao 
FROM [Filmes].[dbo].[Filmes] 
WHERE nome like '%de volta para o futuro%'

--4 Buscar os filmes lançados em 1997
SELECT [Id],[Nome],[Ano],Duracao
FROM [Filmes].[dbo].[Filmes]
WHERE Ano = 1997

--5 Buscar os filmes lançados APÓS o ano 2000
SELECT [Id],[Nome],[Ano],Duracao
FROM [Filmes].[dbo].[Filmes]
WHERE Ano > 2000

--6 Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT [Nome],[Ano],Duracao
FROM [Filmes].[dbo].[Filmes]
WHERE Duracao BETWEEN 100 AND 150
ORDER BY Duracao ASC

--7 Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT f.Ano, COUNT(f.Id) AS Quantidade
FROM Filmes AS f
GROUP BY f.Ano

--8 Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT a.Id,a.PrimeiroNome,a.UltimoNome,a.Genero
FROM Atores AS a
WHERE a.Genero = 'M'

--9 Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT a.Id,a.PrimeiroNome,a.UltimoNome,a.Genero
FROM Atores AS a
WHERE a.Genero = 'F'
ORDER BY a.PrimeiroNome

--10 Buscar o nome do filme e o gênero
SELECT f.Nome,g.Genero
FROM Filmes AS f 
INNER JOIN FilmesGenero AS e ON e.IdFilme = f.Id
INNER JOIN Generos AS g on g.Id = e.IdGenero

--11 Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT f.Nome,g.Genero
FROM Filmes AS f 
INNER JOIN FilmesGenero AS e ON e.IdFilme = f.Id
INNER JOIN Generos AS g on g.Id = e.IdGenero
WHERE g.Genero like '%Mistério%'


--12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT f.Nome,a.PrimeiroNome,a.UltimoNome, e.Papel
FROM [Filmes].[dbo].[Filmes] AS f 
INNER JOIN ElencoFilme AS e ON e.IdFilme = f.Id
INNER JOIN Atores AS a on a.Id = e.IdAtor
