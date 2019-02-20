<#import "parts/common.ftl" as c>
<@c.page >
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" value="${filter?ifExists}" placeholder="Search" class="form-control"/>
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group mt-3" >
            <form method="post" enctype="multipart/form-data">
                <div class="form-group" >
                    <input type="text" name="name" placeholder="your tag" value="<#if message??>${message.name}</#if>" class="form-control ${(nameError??)?string('is-invalid', '')}"/>
                    <#if nameError??>
                        <div class="invalid-feedback">
                            ${nameError}
                        </div>
                    </#if>
                </div>
                <div class="form-group" >
                    <input type="text" name="password"value="<#if message??>${message.password}</#if>" placeholder="your message" class="form-control" ${(passwordError??)?string('is-invalid', '')}"/>
                    <#if passwordError??>
                        <div class="invalid-feedback">
                            ${passwordError}
                        </div>
                    </#if>
                </div>
                <div class="form-group" >
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group" >
                    <button type="submit" class="btn btn-primary">Добваить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m2">
                    <span>${message.name}</span>
                    <i>${message.password}</i>
                </div>

                <div class="card-footer text-muted">
                    ${message.author}
                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>
</@c.page>
