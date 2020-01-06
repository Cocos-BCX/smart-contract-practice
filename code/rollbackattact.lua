function init()
    assert(chainhelper:is_owner(),'no auth')
end

function OracleInvoke(num,amount)
    assert(chainhelper:is_owner(),'no auth')

    request = {{2,{v=num}},{2,{v=amount}}}
    event = cjson.encode(request)
    old_amount = chainhelper:get_account_balance(contract_base_info.owner,&quot;COCOS&quot;)
    chainhelper:invoke_contract_function(&quot;contract.dicegame&quot;,&quot;bet&quot;,event)
    new_amount = chainhelper:get_account_balance(contract_base_info.owner,&quot;COCOS&quot;)
    assert(new_amount &gt; old_amount)
end