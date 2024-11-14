function sendToAgendor(loja) {
    const data = {
        name: loja.nome,
        legalName: loja.razao_social || loja.nome,
        cnpj: loja.cnpj,
        description: loja.anotacao || 'Nenhuma descrição disponível.',
        website: loja.site || 'Não disponível',
        contact: {
            email: loja.email || 'sem-email@exemplo.com',
            whatsapp: loja.telefone ? loja.telefone.replace(/\D/g, '') : 'Sem telefone',
            instagram: loja.instagram || 'Não disponível'
        },
        address: {
            street_name: loja.endereco || 'Sem endereço',
            city: loja.cidade || 'Sem cidade',
            state: loja.estado || ''
        }
    };

    console.log("Enviando dados para o Agendor:", data);

    fetch('/portal/functions/agendorProxy.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data),
        credentials: 'include' // Inclui cookies de autenticação se necessário
    })
    .then(response => {
        console.log("Resposta do Agendor:", response);
        return response.json();
    })
    .then(result => {
        if (result.error) {
            alert("Erro ao enviar dados para o Agendor: " + result.error);
        } else {
            alert("Dados enviados com sucesso para o Agendor!");
            console.log("Resultado do Agendor:", result);

            // Atualizar o status da loja no sistema
            updateStoreAgendorStatus(loja.id);
            
            // Alterar o botão para 'Enviado'
            const button = document.querySelector(`#storeDetails-${loja.id} .btn-secondary`);
            button.textContent = 'Enviado';
            button.classList.remove('btn-secondary');
            button.classList.add('btn-success');
            button.disabled = true; // Desabilita o botão
        }
    })
    .catch(error => {
        console.error("Erro ao enviar dados para o Agendor:", error);
        alert("Erro ao enviar dados para o Agendor: " + error.message);
    });
}

function updateStoreAgendorStatus(storeId) {
    console.log("Atualizando status da loja com ID:", storeId);
    
    fetch(`/portal/functions/updateStoresStatusAgendor.php?storeId=${storeId}`, {
        method: 'POST',
        credentials: 'include'
    })
    .then(response => {
        console.log("Resposta da atualização de status:", response);
        return response.json();
    })
    .then(result => {
        console.log("Resultado da atualização:", result); // Log da resposta
        if (result.success) {
            console.log("Status do Agendor atualizado com sucesso!");
        } else {
            console.error("Erro ao atualizar o status Agendor:", result.error);
        }
    })
    .catch(error => {
        console.error("Erro ao atualizar status Agendor:", error);
    });
}
