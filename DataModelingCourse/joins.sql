use master
go

use AuthServer
go

--SELECT TOP (10) * FROM [AuthServer].[dbo].[Funcionarios]
--SELECT TOP (10) * FROM [AuthServer].[dbo].[Setores]

--select * from [dbo].[Funcionarios]
--where ()

	--select *
	--from dbo.Funcionarios as f
	--full join dbo.Setores as s
	--on f.SetorId = s.SetorId


--begin tran join_sample
	--select *
	--from dbo.Funcionarios as f
	--full join dbo.Setores as s
	--on f.SetorId = s.SetorId
	--where s.SetorId is null or f.FuncionarioNome is null
--rollback tran join_sample
--commit tran join_sample

select (select 'retorna essa string') as subconsulta

