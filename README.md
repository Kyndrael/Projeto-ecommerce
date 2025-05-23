# 🚀 Desafio SQL – Views e Triggers no E-commerce

Esse projeto faz parte de um desafio prático focado em banco de dados com MySQL. A ideia foi criar **views personalizadas** para diferentes perfis de usuário e **triggers** para automatizar algumas ações no sistema, como registrar alterações e exclusões.

---

## 🛠 O que tem aqui?

### 🔎 Views (visões)

- Quantidade de funcionários por departamento e localidade
- Lista de departamentos e seus gerentes
- Projetos com mais funcionários (ordenados do maior pro menor)
- Relação de projetos, departamentos e gerentes
- Funcionários que têm dependentes e se são ou não gerentes

### 🔐 Permissões

- **Usuário `gerente`**: acesso total a dados de funcionários e departamentos
- **Usuário `employee`**: acesso limitado, sem ver dados dos gerentes ou departamentos

### ⚙️ Triggers (gatilhos)

- **Antes de deletar um usuário**: salvamos os dados dele num log
- **Antes de atualizar salário**: registramos o valor antigo e o novo

---

## 💻 Como rodar

Se você tiver o MySQL instalado, pode executar os scripts assim:

```bash
mysql -u root -p < views/create_views.sql
mysql -u root -p < views/permissions.sql
mysql -u root -p < triggers/before_delete_user.sql
mysql -u root -p < triggers/before_update_salary.sql
