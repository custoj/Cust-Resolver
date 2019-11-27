select xmlforest(xmlforest(u.id as id,concat(p.real_name,' - ',p.school)as university)as team) from "user" u
join user_profile p on p.user_id=u.id
join submission s on s.user_id=u.id
where u.username~'team71\d{3}'
and contest_id=6
union all
select xmlforest(xmlforest(row_number() over (order by s.create_time) as id,ascii(p._id)-64 as problem,extract(epoch from s.create_time-c.start_time) as time,s.user_id as team,true as judged,case when s.result=0 then true else false end as solved,case when s.result=0 or s.result=-2 then false else true end as penalty,case when f.is_first_solve=true then true else false end as "first-to-solve")as run) from submission s
join "user" u on u.id=user_id
join problem p on p.id=s.problem_id
join contest c on c.id=s.contest_id
left join (
    select problem_id,min(s.create_time)as first_solve_time,true as is_first_solve from submission s
    join "user" u on u.id=user_id
    where contest_id=6
    and result=0
    and admin_type='Regular User'
    group by problem_id
)f on s.create_time=f.first_solve_time
where s.contest_id=6
and u.admin_type='Regular User'